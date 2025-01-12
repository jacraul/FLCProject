class DFA:
    def __init__(self):
        self.transitions = {
            0: {'0': 1},        
            1: {'1': 2},          
            2: {'0': 3, '1': 2},  
            3: {'0': 3, '1': 2},  
            4: {},                
        }
        self.start_state = 0
        self.final_states = {3}
        self.dead_state = 4

    def transition(self, current_state, symbol):
        return self.transitions.get(current_state, {}).get(symbol, self.dead_state)

    def validate_string(self, input_string):
        current_state = self.start_state
        for symbol in input_string:
            current_state = self.transition(current_state, symbol)
        return current_state in self.final_states


dfa = DFA()
test_strings = [
    "010",    
    "0110",   
    "01",       
    "100",      
    "0101010", 
]

for string in test_strings:
    result = "Accepted" if dfa.validate_string(string) else "Rejected"
    print(f"String: {string} -> {result}")
