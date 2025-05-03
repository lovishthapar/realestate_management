CREATE OR REPLACE PROCEDURE insert_agent(
    agent_id_in IN INT,
    agent_name_in IN VARCHAR2,
    agent_mobile_in IN VARCHAR2,
    agent_email_in IN VARCHAR2,
    agent_username_in IN VARCHAR2,
    agent_password_in IN VARCHAR2,
    agent_address_in IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Agent (
        Agent_id,
        Agent_name,
        Agent_mobile,
        Agent_email,
        Agent_username,
        Agent_password,
        Agent_address
    )
    VALUES (
        agent_id_in,
        agent_name_in,
        agent_mobile_in,
        agent_email_in,
        agent_username_in,
        agent_password_in,
        agent_address_in
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE update_agent (
    p_agent_id IN Agent.Agent_id%TYPE,
    p_agent_mobile IN Agent.Agent_mobile%TYPE,
    p_agent_email IN Agent.Agent_email%TYPE,
    p_agent_address IN Agent.Agent_address%TYPE
)
IS
BEGIN
    UPDATE Agent SET
        Agent_mobile = p_agent_mobile,
        Agent_email = p_agent_email,
        Agent_address = p_agent_address
    WHERE Agent_id = p_agent_id;
    COMMIT
END;
/

CREATE OR REPLACE PROCEDURE print_agent(
    p_agent_id IN Agent.Agent_id%TYPE
)
IS
    v_agent Agent%ROWTYPE;
BEGIN
    SELECT * INTO v_agent
    FROM Agent
    WHERE Agent_id = p_agent_id;
    
    -- Print the agent details
    DBMS_OUTPUT.PUT_LINE('Agent ID: ' || v_agent.Agent_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_agent.Agent_name);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_agent.Agent_mobile);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_agent.Agent_email);
    DBMS_OUTPUT.PUT_LINE('Username: ' || v_agent.Agent_username);
    DBMS_OUTPUT.PUT_LINE('Password: ' || v_agent.Agent_password);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_agent.Agent_address);
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Agent not found for Agent ID: ' || p_agent_id);
END;
/

CREATE OR REPLACE PROCEDURE delete_agent (
    p_agent_id IN Agent.Agent_id%TYPE
)
IS
BEGIN
    DELETE FROM Agent
    WHERE Agent_id = p_agent_id;
    COMMIT;
END;