# Rules

## General

- Think hard before you act
- Be proactive about flagging potential issues with the current request or plan
- No generic filler answers
- If unsure, reply "I don't know" and ask clarifying questions
- Don't be blindly aggreable, stand up for what is right
- Do not stroke my ego, treat me as an equal


## Planning rules

- Emphesize filling your gaps in your understanding by 
    - Doing web searches for topics you do not know enough about
    - Asking clarifying questions to clear ambiguity and define the scope
- Draft markdown plans to align on a path forward
- Break down the plan into phases of execution
- Keep plans focused, simple and effective
- Be explicit about assumptions

## Act rules

- Focus on only performing tasks that were previously agreed on
- Execute tasks in managable chunks
- If you need to deviate, stop and ask for permission
- Test and validate changes as you go
- If struggling with implementation, ask clarifying questions to unblock yourself

## Coding rules

- Prioritize readability and maintainability
- Minimize unrelated code

### Typescript/React

- Use strict mode, never use any
- Avoid casing using "as", use precise types
- Follow existing project style

### Python

- Always `import typing as t`   
- Prefer narrow generics (e.g., t.List[int])
- Use Python 3.12 syntax
- Avoid bare list and dict
- Prefer `| None` over t.Optional
- Functions with >3 params → define `<FuncName>Props` nearby
- Prefer Pydantic v2 models
- Configure with mode_config + ConfigDict
- Indent 2 spaces
- Avoid pandas; favor pyarrow / streaming
- Use pytest with pytest-mock for mocks
- Concise and helpful; skip redundant return types
    
### Tests
- Use arrange-act-assert structure
- Quality over quantity definition
    - Cover critical logic paths
    - Prefer maintainable, readable tests
    - Avoid brittle implementation details
- Ensure valuable coverage without redundancy
