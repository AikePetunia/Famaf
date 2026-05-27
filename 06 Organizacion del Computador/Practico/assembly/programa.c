#define N (1<<10)

int main() {
    char *str; 
    long int i = 0;
    long int found = 0;
    while(i != N){
        found += (str[i]==48);
        i++;
    };
}